# 🗄️ Modelo de Dados do Projeto (Supabase / Planilha)

Este documento detalha a estrutura exata do banco de dados relacional utilizado para o mapeamento dos pontos de coleta de lixo eletrônico em Rio do Sul e Mirim Doce.

---

## 📊 Estrutura das Tabelas (Entidades e Atributos)

### 1. `pontos_coleta`
Tabela principal que centraliza as informações de localização e identificação dos ecopontos e associações.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | INT (PK) | Identificador único do ponto de coleta. |
| `nome` | VARCHAR | Nome oficial ou fantasia do local. |
| `logradouro` | VARCHAR | Rua / Avenida e número do local. |
| `bairro` | VARCHAR | Bairro onde se localiza. |
| `municipio_id` | VARCHAR | Identificador da cidade (Rio do Sul ou Mirim Doce). |
| `contato` | VARCHAR | Telefone, WhatsApp, e-mail ou secretaria responsável. |
| `link_maps` | TEXT (URL) | Link de geolocalização para rota no Google Maps. |
| `observação` | TEXT | Notas complementares sobre o local. |

---

### 2. `materiais_aceitos`
Tabela que faz o mapeamento de quais resíduos eletrônicos e componentes são permitidos em cada ponto.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id_material` | INT (PK) | Identificador único do registro de material. |
| `id_ponto` | INT (FK) | Relacionamento com o ponto de coleta (`pontos_coleta.id`). |
| `tipo_material` | VARCHAR | Categoria do resíduo (ex: Informática, Celulares, Linha Branca, Pilhas). |
| `aceita` | BOOLEAN | `TRUE` se o local aceita o material, `FALSE` se não aceita. |
| `observação` | TEXT | Restrições ou detalhes específicos sobre o descarte do item. |

---

### 3. `procedimentos_descarte`
Regras operacionais, logística de recebimento e restrições de funcionamento de cada ecoponto.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | INT (PK) | Identificador único do procedimento. |
| `id_ponto` | INT (FK) | Relacionamento com o ponto de coleta (`pontos_coleta.id`). |
| `horario` | VARCHAR | Dias da semana e horários de atendimento ao público. |
| `agendamento` | VARCHAR | Se o descarte é livre ou se necessita agendamento prévio. |
| `custo` | VARCHAR | Se o serviço cobra taxas ou se é gratuito (Pessoa Física). |
| `modalidade` | VARCHAR | Formato da entrega (ex: Entrega Voluntária, Mutirão, Misto). |
| `descrição` | TEXT | Orientações de segurança (backup, destruição de dados, armazenamento seco). |

---

### 4. `evidencias`
Armazena links de comprovação e auditoria que validam a existência e o funcionamento real do ponto mapeado.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | INT (PK) | Identificador único da evidência. |
| `id_ponto` | INT (FK) | Relacionamento com o ponto de coleta (`pontos_coleta.id`). |
| `tipo` | VARCHAR | Tipo do documento (ex: Foto, Notícia, Decreto, Site Oficial). |
| `descrição` | TEXT | Detalhes sobre o que a evidência está comprovando. |
| `arquivo/link` | TEXT (URL) | URL direta para a imagem, documento ou notícia oficial. |
| `data_verificação`| DATE | Data em que os acadêmicos validaram a informação em campo. |

---

### 5. `analises_criticas`
Centraliza o diagnóstico socioambiental elaborado para os municípios de Rio do Sul e Mirim Doce.

| Campo | Tipo | Descrição |
| :--- | :--- | :--- |
| `id` | INT (PK) | Identificador único da análise crítica. |
| `cidade` | VARCHAR | Nome do município analisado (Rio do Sul / Mirim Doce). |
| `facilidade` | TEXT | Pontos fortes encontrados na infraestrutura atual de descarte. |
| `dificuldades` | TEXT | Barreiras físicas, geográficas ou burocráticas da região. |
| `divulgação` | TEXT | Crítica sobre como a prefeitura ou órgãos comunicam a população. |
| `melhorias` | TEXT | Propostas práticas sugeridas (QR Codes, rotas itinerantes, parcerias). |

---

## 🔗 Chaves e Relacionamentos
* A tabela `pontos_coleta` funciona como o coração do ecossistema.
* As tabelas `materiais_aceitos`, `procedimentos_descarte` e `evidencias` utilizam a chave estrangeira (`id_ponto` ou `id`) apontando diretamente para `pontos_coleta.id` para garantir a integridade dos dados (1:N — um ponto de coleta pode ter vários materiais, vários procedimentos e várias evidências vinculadas).

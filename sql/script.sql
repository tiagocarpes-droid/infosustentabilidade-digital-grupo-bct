CREATE TABLE pontos_coleta (
    id_ponto SERIAL PRIMARY KEY,
    nome_local VARCHAR(150) NOT NULL,
    endereco VARCHAR(200) NOT NULL,
    bairro VARCHAR(100),
    cidade VARCHAR(100) NOT NULL, -- Aqui entra Rio do Sul ou Mirim Doce
    contato VARCHAR(150),
    link_maps TEXT,
    observacao TEXT
);

CREATE TABLE materiais_aceitos (
    id_material SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    tipo_material VARCHAR(100) NOT NULL,
    aceita BOOLEAN DEFAULT TRUE,
    observacao TEXT
);

CREATE TABLE procedimentos_descarte (
    id_procedimento SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    horario_funcionamento VARCHAR(150),
    precisa_agendamento BOOLEAN,
    possui_custo BOOLEAN,
    modalidade VARCHAR(50),
    descricao_processo TEXT
);

CREATE TABLE evidencias (
    id_evidencia SERIAL PRIMARY KEY,
    id_ponto INTEGER REFERENCES pontos_coleta(id_ponto) ON DELETE CASCADE,
    tipo_evidencia VARCHAR(50),
    descricao TEXT,
    arquivo_ou_link TEXT,
    data_verificacao DATE
);

CREATE TABLE analises_criticas (
    id_analise SERIAL PRIMARY KEY,
    cidade VARCHAR(100) NOT NULL,
    facilidade TEXT,
    dificuldades TEXT,
    divulgacao TEXT,
    melhorias TEXT
);

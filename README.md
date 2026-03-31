# Gerenciamento de Aula - TG

Sistema web para planejamento e organização de aulas, com foco em apoiar docentes no acompanhamento de conteúdos, projetos e cronogramas acadêmicos.

## Autor

- Gabriel Ferreira Marra

## Sobre o Projeto

O **Gerenciamento de Aula** é um Trabalho de Graduação (TG) que propõe uma plataforma para centralizar a rotina de planejamento didático.

A ideia principal é permitir que o usuário:

- organize conteúdos futuros;
- acompanhe o que já foi ministrado;
- visualize atividades e projetos por roadmap e calendário;
- mantenha uma visão clara da distribuição de tarefas e equipes.

## Missão, Visão e Valores

- **Missão:** projetar um sistema web de gerenciamento de aulas para o melhor nível possível de organização.
- **Visão:** tornar a organização do ensino uma ferramenta poderosa para o aprendizado.
- **Valores:** respeito ao método de ensino de cada docente.

## Status do Projeto

**Em desenvolvimento (MVP inicial).**

No estado atual do repositório:

- o frontend está com base React + Vite;
- o backend está com base NestJS criada e estrutura inicial de módulos;
- o Prisma já possui modelo inicial `Usuario` e migração criada.

## Arquitetura

O projeto está dividido em dois serviços principais:

- **Front-end (`front-end`)**: interface web em React + TypeScript.
- **Back-end (`back-end`)**: API em NestJS + TypeScript.

Banco de dados:

- **SQLite**, com modelagem via **Prisma ORM**.

## Tecnologias

### Front-end

- TypeScript
- React
- Vite

### Back-end

- Node.js
- NestJS
- Prisma ORM

### Banco de Dados

- SQLite

## Estrutura de Pastas

```text
.
├── front-end/              # Aplicação React
├── back-end/               # API NestJS + Prisma
├── pasta/
│   ├── missao-visao-valor.md
│   └── diagram.svg         # Fluxo/diagrama do processo
└── README.md
```

## Como Executar Localmente

### Pré-requisitos

- Node.js 20+
- npm

### 1) Clonar o repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd gerenciamento_de_aula_TG
```

### 2) Subir o Back-end

```bash
cd back-end
npm install
npm run start:dev
```

Backend padrão: `http://localhost:3000`

### 3) Subir o Front-end

Em outro terminal:

```bash
cd front-end
npm install
npm run dev
```

Frontend padrão: `http://localhost:5173`

## Banco de Dados (Prisma)

No backend, o projeto já contém schema e migração inicial.

Comandos úteis:

```bash
cd back-end
npx prisma migrate dev
npx prisma generate
```

Se necessário, ajuste a variável `DATABASE_URL` no arquivo `back-end/.env` para seu ambiente local SQLite.

## Próximas Evoluções (Sugestão)

- autenticação (cadastro/login);
- CRUD de aulas, turmas, alunos e projetos;
- agenda/calendário com filtros por período;
- roadmap visual por disciplina/turma;
- dashboard com progresso das aulas.

## Observações

- Este repositório reúne o desenvolvimento técnico do TG.
- O diagrama de fluxo e o documento de missão/visão/valores estão na pasta `pasta/`.

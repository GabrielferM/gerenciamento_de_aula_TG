-- CreateTable
CREATE TABLE "Turma" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "descricao" TEXT NOT NULL,
    "quantidade_aluno" INTEGER NOT NULL,
    "periodo" TEXT NOT NULL,
    "usuario_id" INTEGER NOT NULL,
    CONSTRAINT "Turma_usuario_id_fkey" FOREIGN KEY ("usuario_id") REFERENCES "Usuario" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Materia" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "descricao" TEXT
);

-- CreateTable
CREATE TABLE "Aluno" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "ra" TEXT,
    "turma_id" INTEGER NOT NULL,
    CONSTRAINT "Aluno_turma_id_fkey" FOREIGN KEY ("turma_id") REFERENCES "Turma" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Agenda" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "dia" DATETIME NOT NULL,
    "conteudo" TEXT NOT NULL,
    "status" TEXT NOT NULL DEFAULT 'PLANEJADO',
    "arquivo" TEXT,
    "turma_id" INTEGER NOT NULL,
    "materia_id" INTEGER NOT NULL,
    CONSTRAINT "Agenda_turma_id_fkey" FOREIGN KEY ("turma_id") REFERENCES "Turma" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Agenda_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "Materia" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Presenca" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "presente" BOOLEAN NOT NULL DEFAULT true,
    "aluno_id" INTEGER NOT NULL,
    "agenda_id" INTEGER NOT NULL,
    CONSTRAINT "Presenca_aluno_id_fkey" FOREIGN KEY ("aluno_id") REFERENCES "Aluno" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Presenca_agenda_id_fkey" FOREIGN KEY ("agenda_id") REFERENCES "Agenda" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Projeto" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT,
    "prazo_entrega" DATETIME,
    "turma_id" INTEGER NOT NULL,
    "materia_id" INTEGER NOT NULL,
    CONSTRAINT "Projeto_turma_id_fkey" FOREIGN KEY ("turma_id") REFERENCES "Turma" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Projeto_materia_id_fkey" FOREIGN KEY ("materia_id") REFERENCES "Materia" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Equipe" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome_grupo" TEXT NOT NULL,
    "projeto_id" INTEGER NOT NULL,
    CONSTRAINT "Equipe_projeto_id_fkey" FOREIGN KEY ("projeto_id") REFERENCES "Projeto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Task" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "titulo" TEXT NOT NULL,
    "descricao" TEXT,
    "status" TEXT NOT NULL DEFAULT 'PENDENTE',
    "data_limite" DATETIME,
    "projeto_id" INTEGER NOT NULL,
    CONSTRAINT "Task_projeto_id_fkey" FOREIGN KEY ("projeto_id") REFERENCES "Projeto" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_AlunoNasEquipes" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_AlunoNasEquipes_A_fkey" FOREIGN KEY ("A") REFERENCES "Aluno" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_AlunoNasEquipes_B_fkey" FOREIGN KEY ("B") REFERENCES "Equipe" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Usuario" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "nome" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "senha" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_Usuario" ("email", "id", "nome", "senha") SELECT "email", "id", "nome", "senha" FROM "Usuario";
DROP TABLE "Usuario";
ALTER TABLE "new_Usuario" RENAME TO "Usuario";
CREATE UNIQUE INDEX "Usuario_email_key" ON "Usuario"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "Aluno_ra_key" ON "Aluno"("ra");

-- CreateIndex
CREATE UNIQUE INDEX "_AlunoNasEquipes_AB_unique" ON "_AlunoNasEquipes"("A", "B");

-- CreateIndex
CREATE INDEX "_AlunoNasEquipes_B_index" ON "_AlunoNasEquipes"("B");

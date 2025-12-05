# Formalização do Insertion Sort em Coq (Rocq)

Este repositório contém o projeto final da disciplina de **Lógica Computacional 1** da Universidade de Brasília (UnB).

O objetivo deste trabalho é a implementação funcional do algoritmo de ordenação *Insertion Sort* e a verificação formal de sua correção utilizando o assistente de provas **Rocq (Coq)**.

## 📋 Sobre o Projeto

O projeto consiste em provar que a implementação do algoritmo satisfaz duas propriedades fundamentais para qualquer lista de entrada:
1.  **Ordenação (`Sorted`):** A lista resultante está ordenada de forma não decrescente.
2.  **Permutação (`Permutation`):** A lista resultante contém exatamente os mesmos elementos da lista original.

A estratégia de prova utilizada foi a de **Divisão e Conquista**, isolando as propriedades da função auxiliar de inserção (`insert`) antes de provar o teorema principal por indução estrutural.

## 📂 Estrutura do Repositório

* **`insertion_sort.v`**: Arquivo principal contendo o código fonte. Inclui:
    * Definições recursivas de `insert` e `insertion_sort`.
    * Lemas auxiliares (`insert_sorted` e `insert_perm`).
    * Teorema principal de correção (`insertion_sort_correct`).
* **`relatorio.pdf`**: Documentação detalhada do projeto, contendo a explicação da estratégia adotada, as provas em linguagem natural e o relato do desenvolvimento.
* **`_CoqProject`**: Arquivo de configuração para mapeamento das bibliotecas e compilação.

## 🚀 Como Executar

### Pré-requisitos
* **Coq** (versão 8.10 ou superior)
* **VS Code** com a extensão **VSCoq** (Recomendado) ou **CoqIDE**.

### Passo a Passo
1.  Clone este repositório:
    ```bash
    git clone [https://github.com/Tarsila07/insertion_sort-coq.git]
    ```

2.  **Executando no CoqIDE:**
    * Abra o aplicativo **CoqIDE**.
    * No menu superior, vá em `File` > `Open` e selecione o arquivo `insertion_sort.v` dentro da pasta do projeto.
    * Para processar e verificar as provas:
        * Utilize as setas na barra de ferramentas superior (ícone de seta para baixo ou "Forward").
        * Ou utilize o atalho `Ctrl` + `Seta para Baixo` (Windows/Linux) ou `Cmd` + `Seta para Baixo` (Mac) para avançar comando por comando.
    * O código verificado ficará verde. Certifique-se de processar o arquivo até o final (`Qed.`) para confirmar que todas as provas estão corretas.

---
*Projeto desenvolvido no semestre 2025/2*

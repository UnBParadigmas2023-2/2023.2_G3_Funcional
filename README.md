# RPG de Texto

**Disciplina**: FGA0210 - PARADIGMAS DE PROGRAMAÇÃO - T01 <br>
**Nro do Grupo**: 03<br>
**Paradigma**: Funcional<br>

## Alunos

| Matrícula  | Aluno                             |
| ---------- | --------------------------------- |
| 19/0010606 | Artur de Sousa Vieira             |
| 19/0024950 | Arthur de Melo Garcia             |
| 19/0011424 | Carlos Eduardo Miranda Roriz      |
| 17/0032591 | Edvan Barreira Gomes Júnior       |
| 19/0109963 | João Victor Teixeira Batista      |
| 19/0112123 | Lucas Gabriel Sousa Camargo Paiva |
| 20/0023411 | Luíza Esteves dos Santos          |
| 16/0141842 | Philipe Rosa Serafim              |

## Sobre

O projeto consiste em um jogo de RPG dinâmico em Haskell que traz uma história cômica ao usuário de matrícula no sistema da UnB, onde quem está jogando pode escolher o caminho a ser tomado, e cada um leva a fins diferentes.

O projeto usa de estrutura de grafos e parser para leitura de um arquivo txt para criação dos nós, os quais são navegados de acordo com a opção escolhida pelo usuário.

Abaixo consta a estrutura da história usada para criação do arquivo txt.

![image](https://github.com/UnBParadigmas2023-2/2023.2_G3_Funcional/assets/66687841/603fc808-ea65-4f90-a2d9-4508197ee125)

## Screenshots

Adicione 2 ou mais screenshots do projeto em termos de interface e/ou funcionamento.

## Instalação

**Linguagens**: [Haskell](https://www.haskell.org/downloads/)<br>
**Tecnologias**: [Stack](https://docs.haskellstack.org/en/stable/) e [Cabal](https://www.haskell.org/cabal/)

## Como executar o projeto

Após instalar todas as dependências e clonar o projeto, é necessário acessar a pasta `RPG-TEXTO` e executar o comando `stack build` para compilar o projeto. Para iniciar o programa, basta executar `stack run` ou `stack exec RPG-texto-exe`. Caso queira excluir os binários compilados, basta executar `stack clean`.

## Vídeo

- GitHub: [ACESSO](RGP-texto/Video/videoApresentacao.mp4)

## Participações

Apresente, brevemente, como cada membro do grupo contribuiu para o projeto.
|Nome do Membro | Contribuição | Significância da Contribuição para o Projeto (Excelente/Boa/Regular/Ruim/Nula) |
| -- | -- | -- |
|Artur de Sousa Vieira | Contribuição com a ideia inicial, criação da história, Concepção do parser e documentação | Boa |
|Arthur de Melo Garcia | Contribuiu com a Documentação do projeto | Boa |
|Carlos Eduardo Miranda Roriz | Contribuiu com a implementação toy da estrutura | Excelente |
|Edvan Barreira Gomes Júnior | Contribuiu com a integração do parser ao projeto e documentação do projeto | Boa |
|João Victor Teixeira Batista | Contribuiu com a implementação do parser/filereader e estudo do defeito encontrado | Excelente |
|Lucas Gabriel Sousa Camargo Paiva | Contribuiu com a criação da história, auxiliou na implementação do grafo, correção do defeito encontrado e documentação do projeto | Boa |
|Luíza Esteves dos Santos | Contribuiu com a criação da história, implementação do grafo, estudo do defeito encontrado e documentação do projeto| Excelente |
|Philipe Rosa Serafim | Contribuiu com a estrutura do projeto, modularização, correção do defeito encontrado e documentação do projeto | Excelente |

Menção honrosa ao **Pedro Helias Carlos** que criou o repositório e teve participação no estudo da estrutura do projeto.

## Outros

### Lições Aprendidas

- Implementação da estrutura de grafo
- Paradigma funcional
- Modularização
- Própria linguagem Haskell

### Percepções

### Contribuições e Fragilidades

- A estrutura do texto precisa estar exatamente igual ao padrão estipulado
- GHCI apresentou problemas sem solução na comunidade para algumas máquinas dos membros

### Trabalhos Futuros

- Implementar um criador de cenários que produza arquivos `.txt` no formato suportado pelo parser
- Melhorar interface

## Fontes

- [Cabal](https://www.haskell.org/cabal/)
- [Data.split](https://hackage.haskell.org/package/split-0.2.3.5/docs/Data-List-Split.html)
- [Graphite](https://hackage.haskell.org/package/graphite)
- [Haskell](https://www.haskell.org/downloads/)
- [Martin Erwig's Functional Graph Library](https://hackage.haskell.org/package/fgl)
- Materiais disponibilizados em aula

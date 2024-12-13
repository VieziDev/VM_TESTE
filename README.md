# Teste Técnico VM Tecnologia

Este projeto foi desenvolvido como parte do teste técnico para a VM Tecnologia. O projeto consiste em um aplicativo funcional onde o usuário pode gerar uma lista de números aleatórios a partir da quantidade que ele informar, podendo reordenar a lista manualmente e verificar a ordenação da lista gerada.

## Bibliotecas Utilizadas

- **get_it** (Injeção de Dependência)
- **mocktail** (Testes)

## Justificativa

Optei por utilizar os fundamentos da Clean Architecture aliados ao TDD (Test-Driven Development) para estruturar o projeto de forma organizada, testável e com um bom nível de desacoplamento. No entanto, considerando a simplicidade e a complexidade reduzida do desafio, não foi necessário implementar todas as camadas e diretórios que a Clean Architecture normalmente propõe.

Para atender à necessidade do projeto de forma eficiente, foquei em trabalhar com as camadas de repositórios (repositories) e casos de uso (use cases), implementando suas respectivas interfaces e implementações concretas. Omiti camadas adicionais como entities, models e datasources, uma vez que a natureza do problema não exigia esses elementos para atingir os objetivos do teste.

Para o gerenciamento de estado, utilizei o ValueNotifier, uma solução nativa e leve do Flutter, ideal para cenários de baixa complexidade. O ValueNotifier permitiu implementar reatividade no app sem adicionar dependências externas desnecessárias, mantendo o código limpo, enxuto e alinhado com as melhores práticas.

Além disso, utilizei a biblioteca get_it para gerenciar dependências, garantindo o desacoplamento entre as camadas e melhorando a modularidade. Isso permite maior flexibilidade e facilidade na manutenção e nos testes das partes individuais do sistema.

Essa abordagem foi escolhida para equilibrar simplicidade, robustez e alinhamento com boas práticas, mantendo o foco no que era essencial para resolver o problema proposto sem introduzir complexidade desnecessária.

## Estrutura do Projeto

- **/app**: Originalmente seria uma pasta features, contendo cada funcionalidade separada em subdiretórios, mas pela complexidade exigida decidi simplificar em uma pasta app.
   - **/domain**: Contém as regras de negócio, como contratos (repositórios não implementados) e casos de uso.
   - **/data**: Contém a implementação dos repositórios.
   - **/presentation**: Contém a camada de UI.
- **/core**: Contém elementos genéricos do sistema, que não pertencem a uma funcionalidade ou módulo específico.   
   - **/usecases**: Contém os contratos dos casos de uso.

## Testes

Escrevi testes unitários para os repositórios e casos de uso e utilizei o mocktail para auxiliar no mock de dependências.

### Estrutura dos Testes

- **/test**
   - **/data**: Contém testes unitários dos repositórios.
   - **/domain/usecases**: Contém testes unitários dos casos de uso.

## Instruções de Uso

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/VieziDev/vm_test.git
2. **Navegue até o diretório do projeto:**
   ```bash
   cd vm_test
3. **Baixe os pacotes:**
   ```bash
   flutter pub get
4. **Rode o aplicativo:**
   ```bash
   flutter run

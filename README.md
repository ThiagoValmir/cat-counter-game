#  Cat Counter Game

Um aplicativo Flutter divertido onde o objetivo é adivinhar quantos gatos estão na tela. O número de gatos muda aleatoriamente, e você tem 15 segundos para acertar o número exato. O jogo é simples, mas desafiador, perfeito para testar sua atenção e percepção!

## Funcionalidades

- Adiciona uma quantidade aleatória de gatos na tela. (entre 10-20)
- Escolhe imagens de gatos aleatórias para cada posição.
- Permite que o jogador insira um número no campo de texto.
- Informa se o jogador acertou ou errou o número de gatos na tela.
- Um cronômetro de 15 segundos é ativado para cada rodada.

## Pré-requisitos

Antes de começar, você precisará ter instalado:

Flutter (2.0 ou superior)
Um editor de texto como o VS Code ou Android Studio
Um dispositivo ou emulador configurado para testar o aplicativo.

## Estrutura do projeto

lib/
├── bloc/
│   ├── counter_bloc.dart         # Gerenciamento de estados usando Bloc
│   ├── counter_event.dart        # Eventos relacionados ao contador
│   └── counter_state.dart        # Estados do contador
├── pages/
│   └── counter_page.dart         # Página principal do jogo
├── main.dart                     # Ponto de entrada do aplicativo
assets/
└── images/                       # Imagens dos gatos
├── cat_1.png
├── cat_2.jpg
├── cat_3.png
├── cat_4.png
└── cat_5.jpg
└── cat_6.jpg
└── cat_7.jpg
└── cat_8.jpg
pubspec.yaml                      # Configuração do projeto Flutter

## Tecnologias utilizadas

Flutter: Framework para desenvolvimento multiplataforma.
Bloc: Biblioteca para gerenciamento de estado.
Dart: Linguagem de programação utilizada no Flutter.

Divirta-se com o Cat Counter Game!
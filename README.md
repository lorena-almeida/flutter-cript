# Digital Assets Tracker

Um aplicativo Flutter moderno para acompanhamento de ativos digitais e criptomoedas em tempo real.

## Funcionalidades

- Lista de ativos digitais com preços atualizados
- Variação percentual de preços em 24h
- Interface moderna e responsiva com suporte a tema claro/escuro
- Atualização em tempo real dos dados
- Pull-to-refresh para atualização manual
- Tratamento de erros e estados de carregamento

## Tecnologias Utilizadas

- Flutter
- Provider (Gerenciamento de Estado)
- HTTP (Requisições API)
- Intl (Formatação de números)
- Material Design 3

## Requisitos

- Flutter SDK
- Dart SDK
- Android Studio / VS Code

## Instalação

1. Clone o repositório:
```bash
git clone https://github.com/seu-usuario/digital-assets-tracker.git
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Execute o aplicativo:
```bash
flutter run
```

## Estrutura do Projeto

```
lib/
  ├── models/
  │   └── digital_asset.dart
  ├── providers/
  │   └── assets_provider.dart
  ├── screens/
  │   └── home_screen.dart
  ├── theme/
  │   └── app_theme.dart
  ├── widgets/
  │   ├── asset_list_item.dart
  │   ├── error_message.dart
  │   └── loading_indicator.dart
  └── main.dart
```

## API Utilizada

O aplicativo utiliza a API pública do CoinGecko para obter dados atualizados sobre criptomoedas.

## Contribuição

1. Faça o fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Faça commit das suas alterações (`git commit -m 'Adiciona nova feature'`)
4. Faça push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes. 
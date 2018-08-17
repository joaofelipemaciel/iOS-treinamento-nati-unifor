// Generated using SwiftGen, by O.Halligon — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// swiftlint:disable explicit_type_interface identifier_name line_length nesting type_body_length type_name
enum L10n {

  enum App {
    /// Agenda
    static let title = L10n.tr("Localizable", "app.title")
  }

  enum Contatos {
    /// Edicão Desabilitada
    static let ativaredicao = L10n.tr("Localizable", "contatos.ativaredicao")
    /// Confirmar Edicão
    static let confirmar = L10n.tr("Localizable", "contatos.confirmar")
    /// Criar
    static let criar = L10n.tr("Localizable", "contatos.criar")
    /// Deslogar
    static let deslogar = L10n.tr("Localizable", "contatos.deslogar")
    /// Editar
    static let editar = L10n.tr("Localizable", "contatos.editar")
    /// Email
    static let email = L10n.tr("Localizable", "contatos.email")
    /// Excluir
    static let excluir = L10n.tr("Localizable", "contatos.excluir")
    /// Nome
    static let nome = L10n.tr("Localizable", "contatos.nome")
    /// Novo Contato
    static let novocontato = L10n.tr("Localizable", "contatos.novocontato")
    /// Telefone
    static let telefone = L10n.tr("Localizable", "contatos.telefone")
    /// Contatos
    static let title = L10n.tr("Localizable", "contatos.title")
    /// URL Imagem
    static let urlimagem = L10n.tr("Localizable", "contatos.urlimagem")
  }

  enum Login {
    /// Cadastrar
    static let cadastrar = L10n.tr("Localizable", "login.cadastrar")
    /// Email
    static let email = L10n.tr("Localizable", "login.email")
    /// Entrar
    static let entrar = L10n.tr("Localizable", "login.entrar")
    /// Senha
    static let senha = L10n.tr("Localizable", "login.senha")

    enum Cadastrar {
      /// Confirmar Senha
      static let confirmarsenha = L10n.tr("Localizable", "login.cadastrar.confirmarsenha")
      /// E-Mail
      static let email = L10n.tr("Localizable", "login.cadastrar.email")
      /// Senha
      static let senha = L10n.tr("Localizable", "login.cadastrar.senha")
    }
  }
}
// swiftlint:enable explicit_type_interface identifier_name line_length nesting type_body_length type_name

extension L10n {
  fileprivate static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}

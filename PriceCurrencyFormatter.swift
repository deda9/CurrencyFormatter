import Foundation

protocol PriceCurrencyFormatting {
    var currencyFormatter: NumberFormatter { get }
    var currencyLocaleMapper: CurrencyLocaleMapping { get }
    func getPriceWithCurrency(currencyCode: String?, amount: Int?) -> String
}

extension PriceCurrencyFormatting {
    func getPriceWithCurrency(currencyCode: String?, amount: Int?) -> String {
        guard let currencyCode = currencyCode, let amount = amount else {
            return ""
        }
        let locale = self.currencyLocaleMapper.map(from: currencyCode) //TODO: we need to call this ones 
        self.currencyFormatter.locale = locale
        return (self.currencyFormatter.string(from: NSNumber(value: Float(amount) / 100.0)) ?? "").replacingOccurrences(of: "CHF", with: "Fr")
    }
}

struct PriceCurrencyFormatter: PriceCurrencyFormatting {
    var currencyFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter
    }()
    
    var currencyLocaleMapper: CurrencyLocaleMapping = {
        return CurrencyLocaleMapper()
    }()
}

protocol CurrencyLocaleMapping {
    typealias LocaleCurrency = (currencyCode: String, localeIdentifier: String)
    var locales: [LocaleCurrency] { get set }
    func map(from currencyCode: String) -> Locale
}

struct CurrencyLocaleMapper: CurrencyLocaleMapping {
    var locales: [LocaleCurrency] = [(currencyCode: "EUR", localeIdentifier: "de_DE"),
                                     (currencyCode: "CHF", localeIdentifier: "ch_CHE"),
                                     (currencyCode: "GBP", localeIdentifier: "en_GB"),
                                     (currencyCode: "USD", localeIdentifier: "en_US"),
                                     (currencyCode: "CZK", localeIdentifier: "cs_CZ"),
                                     (currencyCode: "PLN", localeIdentifier: "pl_PL"),
                                     (currencyCode: "DKK", localeIdentifier: "da_DK")]
    
    func map(from currencyCode: String) -> Locale {
        let identifier = locales.find { $0.currencyCode == currencyCode }?.localeIdentifier ?? "de_DE"
        return Locale(identifier: identifier)
    }
}

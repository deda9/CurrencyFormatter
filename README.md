# CurrencyFormatter
Easy way to format the price with currency 

```Swift
class Tester {
    func test() {
        let fomatter = PriceCurrencyFormatter.init()
        print(fomatter.getPriceWithCurrency(currencyCode: "PLN", amount: 100)) //1,00 zł
        print(fomatter.getPriceWithCurrency(currencyCode: "DKK", amount: 100)) //1,00 kr.
        print(fomatter.getPriceWithCurrency(currencyCode: "CHF", amount: 100)) //Fr 1.00
        print(fomatter.getPriceWithCurrency(currencyCode: "CZK", amount: 100)) //1,00 Kč
        print(fomatter.getPriceWithCurrency(currencyCode: "USD", amount: 100)) //$1.00
        print(fomatter.getPriceWithCurrency(currencyCode: "EUR", amount: 100)) //1,00 €
        print(fomatter.getPriceWithCurrency(currencyCode: "CHF", amount: 100)) //Fr 1.00
    }
}

let tester = Tester()
tester.test()
````

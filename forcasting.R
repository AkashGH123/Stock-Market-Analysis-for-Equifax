library('quantmod')
library('forecast')
getSymbols('FB',src = 'yahoo')
names(FB)
plot(FB$FB.Close)
fit <- auto.arima(FB$FB.Close,ic='bic')
fit
plot(as.ts(FB$FB.Close))

lines(fitted(fit),col='red')

fit.arima <- forecast(fit)
fit.arima
plot(fit.arima)
fb_return <- diff(FB$FB.Close)/lag(FB$FB.Close,k=1)*100
head(fb_return)
tail(fb_return)

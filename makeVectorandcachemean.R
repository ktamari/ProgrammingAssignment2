makeVector <- function(x = numeric()){  #makeVector関数が定義され，xには平均を計算するためのベクトルが入る．
        m <- NULL　　　　　　　　　　　#まずはじめにmにNULLが投入される．　
        set <- function(y){　　　　　　#次にSet関数（）に定義されたyは，xとして別環境にキャッシュされる　　
                x <<- y　　　　　　　　
                m <<- NULL　　　　　　　#mにはNULLが別環境にキャッシュされる．
        }
        get <- function()x　　　　　　　　　#次にget関数が定義される　キャッシュされたxが読み込まれる
        setmean <- function(mean) m<<- mean　　#次にsetmean関数が定義される．mには計算されたmeanが別環境にキャッシュされる
        getmean <- function()m       #getmeanが定義される．上でキャッシュされたmが呼び出される．
        list(set= set, get=get,　　
             setmean= setmean,　　　　#makeVectorでは，二つのObjectがストアされ，一          getmean= ge
cachemean <- function(x,...){
        m <- x$getmean()
        if(!is.null(m)){
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- mean(data, ...)
        x$setmean(m)
        m
}
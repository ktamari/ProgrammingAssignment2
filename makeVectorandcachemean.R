makeVector <- function(x = numeric()){  #makeVector�֐�����`����Cx�ɂ͕��ς��v�Z���邽�߂̃x�N�g��������D
        m <- NULL�@�@�@�@�@�@�@�@�@�@�@#�܂��͂��߂�m��NULL�����������D�@
        set <- function(y){�@�@�@�@�@�@#����Set�֐��i�j�ɒ�`���ꂽy�́Cx�Ƃ��ĕʊ��ɃL���b�V�������@�@
                x <<- y�@�@�@�@�@�@�@�@
                m <<- NULL�@�@�@�@�@�@�@#m�ɂ�NULL���ʊ��ɃL���b�V�������D
        }
        get <- function()x�@�@�@�@�@�@�@�@�@#����get�֐�����`�����@�L���b�V�����ꂽx���ǂݍ��܂��
        setmean <- function(mean) m<<- mean�@�@#����setmean�֐�����`�����Dm�ɂ͌v�Z���ꂽmean���ʊ��ɃL���b�V�������
        getmean <- function()m       #getmean����`�����D��ŃL���b�V�����ꂽm���Ăяo�����D
        list(set= set, get=get,�@�@
             setmean= setmean,�@�@�@�@#makeVector�ł́C���Object���X�g�A����C��          getmean= ge
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
'
Quiz about flow control
'
check.mod7 <- function(x) { 
  if (x %% 7 < 4) {
    out <- "Hi" 
    } else {
    out <- "Bye"
    }
  return(out) 
  }
check.fizz_and_buzz <- function(x) {
  a <- x %% 3 == 0
  b <- x %% 5 == 0
  if (a | b ) {
    if (a & b) {
      out <- "FizzBuzz"
    } else if (a) {
      out <- "Fizz"
    } else if (b) {
      out <- "Buzz"
    } else {
      out <- check.mod7(x)
    }
  } else {
    out <- check.mod7(x)
  }
  return(out)
}
this.seq <- 1:100
for (i in this.seq) {
  to_print_out <- paste(i, "is", check.fizz_and_buzz(i))
  print(to_print_out)
}
sapply(this.seq, function(x) print(check.fizz_and_buzz(x)))


# 找出 mtcars 中, disp 高於中位數的車款

# 請依照 condition statement 判斷數字大小的範例, 比較以 for loop 與 sapply 之速度
# sample 的範圍請從 1 - 100 中選取 99 個
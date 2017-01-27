#Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.

1. (32 * 4) >= 129
# 32 * 4  = 128
# expression is 128 > = 129
#ANSWER = FALSE
2. false != !true
# expression is false is not equal to false
#ANSWER = FALSE
3. true == 4
#ANSWER = FALSE
4. false == (847 == '874')
# expression is false == (false)
#ANSWER = TRUE
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false
# if this side is true in "true || false" , the false on right side is not executed
# (!true || (!(20) == 20) || ((328 / 4) == 82)) || false
#!20 => false
# (!true || (false) == 20) || ((328 / 4) == 82)) || false
#  false == 20 ==> false
# (!true || false || ((328 / 4) == 82)) || false
# (!true || false || (82 == 82)) || false
# 82 == 82 ==> true
# (!true || false || (true)) || false
# (!true || false || true) || false
# !true ==> false
# (false || false || true) || false
# (false || false || true) ==> true
# true || false ==> true
# true || false
#ANSWER = TRUE

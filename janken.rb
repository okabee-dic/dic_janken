class Player
  def setHand(h)
    @hand = h
    if(h > 2)
      @hand = 2
    end
  end

  def getHand()
    return @hand
  end

  def getHandStr()
    str = ""
    if(@hand == 0)
      str = "グー"
    elsif(@hand == 1)
      str = "チョキ"
    else
      str = "パー"
    end
    return str
  end
end

class Human < Player
  def pon
    puts "入力してください（グー=0 チョキ=1 パー=2）"
    te = gets.to_i
    setHand(te)
  end
end

class Com < Player
  def random
    te = rand(1..3)
    setHand(te)
  end
end

class Janken
  def judge(a,b)
    r = (a-b+3)%3

    return r
  end
end


human = Human.new
com = Com.new

while(true)
  human.pon
  com.random

  puts "自分は#{human.getHandStr}で、相手は#{com.getHandStr}"

  janken = Janken.new
  r = janken.judge(human.getHand, com.getHand)

  if(r != 0)
    break;
  end
end

if(r == 1)
  puts("負けです")
else
  puts("勝ちです")
end

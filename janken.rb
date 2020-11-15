class Player
  def hand
    # 「プレイヤーに 0 ~ 2を入力させる文章」を表示させます。
    puts "数字を入力してください。"
    puts "0:グー, 1:チョキ, 2:パー"
    player_hand = gets.to_i

    while true do
      if player_hand == 0 || player_hand == 1 || player_hand == 2
        return player_hand
      else
        puts "数字を入力してください。"
        puts "0:グー, 1:チョキ, 2:パー"
        player_hand = gets.to_i
        return player_hand if player_hand == 0 || player_hand == 1 || player_hand == 2
      end
    end
  end
end

class Enemy
  def hand
    return enemy_hand = rand(0..2)
    # グー、チョキ、パーの値をランダムに出力させます。
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    janken = ["グー", "チョキ", "パー"]

    judge_num = (((player_hand.to_i-enemy_hand.to_i)+3)%3)

    if judge_num == 1
      puts "相手の手は#{janken[enemy_hand]}です。あなたの負けです。"
      return false
    elsif judge_num == 2
      puts "相手の手は#{janken[enemy_hand]}です。あなたの勝ちです。"
      return false
    else
      puts "相手の手は#{janken[enemy_hand]}です。引き分けです。"
      return true
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

next_game = ""
while next_game do
  next_game = janken.pon(player.hand, enemy.hand)
end

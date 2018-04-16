class Tictac
    load 'grid.rb'

    $map= {
        "a1" => "0,0",
        "a2" => "0,1",
        "a3" => "0,2",
        "b1" => "1,0",
        "b2" => "1,1",
        "b3" => "1,2",
        "c1" => "2,0",
        "c2" => "2,1",
        "c3" => "2,2"
    }

    @@fields=["a1","a2","a3","b1","b2","b3","c1","c2","c3"]
    attr_accessor :player1, :player2

    def initialize(name1, name2)
        @player1=Player1.new(name1)
        @player2=Player2.new(name2)
        @grid=Grid.new()
        @grid.pretty_print
        puts "\nMreza je spremna igra moze da pocne\n\n"
    end
 
    def chose_iks
      puts "#{player1.name1}e izaberite vase polje X? "        
      x=gets.chomp
      if @@fields.include?x then
      $map.each do |key,val|
        if x==key then
          a= val.split(",")
          @grid.array[a[0].to_i][a[1].to_i]="x"                       
          @grid.pretty_print 
        end
      end
    end
      if @@fields.include?x                                         
        $arr1 << x
      else puts "unesite ispravno polje X -->"
        until  @@fields.include?x 
        
        x=gets.chomp
        puts "unesite ispravno polje X -->"
        $arr1 << x
        $map.each do |key,val|
          if x==key then
            a= val.split(",")
            @grid.array[a[0].to_i][a[1].to_i]="x"
            @grid.pretty_print 
          end
        end
        end
        
       end
       
       @@fields= @@fields - $arr1
       p @@fields
    end


    def chose_oks
      puts "#{player2.name2} izaberite vase polje O? "
      o=gets.chomp
      if @@fields.include?o then
      $map.each do |key,val|
        if o==key then
          a= val.split(",")
          @grid.array[a[0].to_i][a[1].to_i]="o"
          @grid.pretty_print 
        end
       end
      end
       if @@fields.include?o 
         $arr2 << o
       else puts "unesite ispravno polje O --> "
        
        until  @@fields.include?o 
        
          o=gets.chomp
          puts "unesite ispravno polje O -->"
          $arr2 << o
          $map.each do |key,val|
            if o==key then
              a= val.split(",")
              @grid.array[a[0].to_i][a[1].to_i]="o"
              @grid.pretty_print 
            end
          end
          end
       
       end
       
       @@fields= @@fields - $arr2
       p @@fields 
    end

    
    def choose_field
        chose_iks
        chose_oks
        chose_iks
        chose_oks
        chose_iks
        
        return if  pobednik=="X je pobednik" || pobednik=="O je pobednik" 
        chose_oks
        return if  pobednik=="X je pobednik" || pobednik=="O je pobednik"
        chose_iks
        return if  pobednik=="X je pobednik" || pobednik=="O je pobednik"
        chose_oks
        return if  pobednik=="X je pobednik" || pobednik=="O je pobednik"
        if chose_iks 
            puts "nereseno"
        end

    end
    
    def pobednik
        q=["a1","b1","c1"]
        w=["a2","b2","c2"]
        e=["a3","b3","c3"]
        r=["a3","b2","c1"]
        t=["a1","b2","c3"]
        y=["a1","a2","a3"]
        u=["b1","b2","b3"]
        i=["c1","c2","c3"]


        if q.all?{|x| $arr1.include?x} || w.all?{|x| $arr1.include?x} || e.all?{|x| $arr1.include?x} || r.all?{|x| $arr1.include?x} || t.all?{|x| $arr1.include?x} || y.all?{|x| $arr1.include?x} || u.all?{|x| $arr1.include?x} || i.all?{|x| $arr1.include?x} then                              
            puts "X je pobedio"
            return  "X je pobednik"
        elsif q.all?{|x| $arr2.include?x} || w.all?{|x| $arr2.include?x} || e.all?{|x| $arr2.include?x} || r.all?{|x| $arr2.include?x} || t.all?{|x| $arr2.include?x} || y.all?{|x| $arr2.include?x} || u.all?{|x| $arr2.include?x} || i.all?{|x| $arr2.include?x} then 
            puts "O je pobedio"
            return  "O je pobednik"
        
        end
    end
    
    class Player1
        $arr1=[]
        attr_accessor :name1

        def initialize(name1)
        @name1 = name1
        end
    end

    class Player2
        $arr2=[]
        attr_accessor :name2
        def initialize(name2)
            @name2 = name2
            end
    end


end

x=Tictac.new("Boban", "Bojana")

x.choose_field
p $arr1
p $arr2
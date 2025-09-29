fret_nr=-1
until fret_nr>=0 && fret_nr<=24
    puts "What fret are you on? (Write the number, from 0 to 24)"
    fret_nr=gets.chomp.to_i
    if fret_nr<0 || fret_nr>24
        puts "the fret range is from 0 to 24, write a number again"
    end
end

string=0
until string>0 && string<=6
puts "Which string is that on? (write a number from 1 to 6)"
string=gets.chomp.to_i
end

wished_string=0
until wished_string>0 && wished_string<=6
puts "which string are you aiming for? (write a number from 1 to 6)"
wished_string=gets.chomp.to_i
end

notes=[ ]
result_fret=fret_nr
if wished_string==6 || wished_string==1
    notes=["E","F","F#","G","G#","A","A#","B","C","C#","D","D#"]         

elsif wished_string==5
     notes=["A","A#","B","C","C#","D","D#","E","F","F#","G","G#"]
            
elsif wished_string==4
     notes=["D","D#","E","F","F#","G","G#","A","A#","B","C","C#"]

elsif wished_string==3
      notes=["G","G#","A","A#","B","C","C#","D","D#","E","F","F#"]

elsif wished_string==2
      notes=["B","C","C#","D","D#","E","F","F#","G","G#","A","A#"]
end

 # distance hash: let's say you are on the 6th string and you go down to the 5th string, there is a distance of 5 frets, the same from the 5th strong to the 4th and so on,except for the 3rd string that has a difference with the 2nd string of 4 frets

if wished_string<string
    (wished_string...string).each do |i|
    distance={6=>5, 5=> 5, 4=>5, 3=>4, 2=>5, 1=>5}
    result_fret-= distance[i]
    end
    if result_fret<0
     result_fret= 12+result_fret
    end
    puts "The note (#{notes[result_fret]}) you're looking for is on the #{result_fret} fret"
end

if wished_string>string
    (string...wished_string).each do |i|
    distance={6=>5, 5=> 5, 4=>5, 3=>4, 2=>5, 1=>5}
    result_fret+= distance[i]
    end
    puts "The note (#{notes[result_fret%12]}) you're looking for is on the #{result_fret%12} fret"
end




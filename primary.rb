require 'ruby2d'
set title: "visualize lee algorithm"
set width: 1000
set height: 1000
sdfsdfsd
afsdfs

asdfasdfsasd
asdfasdf


def generate(n, xpos, ypos)
  matrix = []
  for col in 0..n
      column = []
      for row in 0..n
          column.push([0, Square.new(
            x: row * 10 + xpos, y: col * 10 + ypos,
            size: 7,
            color: '#f0f0f0',
            z: 1
          ), 0, 0])
      end
      matrix.push(column)
  end
  return matrix
end


def procedurallyGenerateWalls(matrix)
  increment = rand(7) + 2
  matrix.each_with_index do |row,x|
    if (x + 1) % increment == 0
      opening = rand(matrix.length)
        row.each_with_index do |cell,y|
          if y == opening
            matrix[x][y][1].color = "#f0f0f0"
          else
            matrix[x][y][1].color = "#1b1b2f"
            matrix[x][y][0] = 1
          end
      end
    end
  end
  return matrix
end

def identifystartAndEnd(matrix)
  matrix[0][0][1].color = "#e43f5a"
  matrix[30][30][1].color = "#e43f5a"
  return matrix
end

def assemble(arr)
  arr.each do |el|
    el = identifystartAndEnd(procedurallyGenerateWalls(el))
  end
end

def markSuccessPath(arr, matrix)
  arr.each do |el|
    matrix[el[0]][el[1]][1].color = "ff5200"
  end
end




def euclidieanDistance(coordinates, string)
  if string == "start"
    d = (coordinates[0] - 0).abs + (coordinates[1] - 0).abs
  elsif string == "end"
    d = (coordinates[0] - 30).abs + (coordinates[1] - 30).abs
  end
end

$omega = []

$omega << generate(30, 20, 20)
$omega << generate(30, 20, 350)
$omega << generate(30, 20, 680)
$omega << generate(30, 350, 20)
$omega << generate(30, 350, 350)
$omega << generate(30, 350, 680)
$omega << generate(30, 680, 20)
$omega << generate(30, 680, 350)
$omega << generate(30, 680, 680)

assemble($omega)

def validate(num)
  if num < 31
    if num > -1 
    return true
    else
      return false
    end
  else
    return false
  end
end

stack0 = []
stack1 = []
stack2 = []
stack3 = []
stack4 = []
stack5 = []
stack6 = []
stack7 = []
stack8 = []



  def mark(position)
    if validate(position[0])
      if validate(position[1])
       if position[3][position[0]][position[1]][2] === 0
          if position[3][position[0]][position[1]][0] === 0
           


            if position[0] === 30
              if position[1] === 30

                if position[3] === $omega[0]
                Text.new(
                  "#{position[2]}",
                  x: 20, y: 20,
                  size: 100,
                  color: 'blue',
                  z: 10
                )
               position[4] = position[4].clear
               return
               
                elsif position[3] === $omega[1]
                  Text.new(
                  "#{position[2]}",
                  x: 20, y: 350,
                  size: 100,
                  color: 'blue',
                  z: 10
                )
                position[4] = position[4].clear
                return

              elsif position[3] === $omega[2]
                Text.new(
                "#{position[2]}",
                x: 20, y: 680,
                size: 100,
                color: 'blue',
                z: 10
              )
              position[4] = position[4].clear
              return

            elsif position[3] === $omega[3]
              Text.new(
              "#{position[2]}",
              x: 350, y: 20,
              size: 100,
              color: 'blue',
              z: 10
            )
            position[4] = position[4].clear
            return

          elsif position[3] === $omega[4]
            Text.new(
            "#{position[2]}",
            x: 350, y: 350,
            size: 100,
            color: 'blue',
            z: 10
          )
          position[4] = position[4].clear
          return

        elsif position[3] === $omega[5]
          Text.new(
          "#{position[2]}",
          x: 350, y: 680,
          size: 100,
          color: 'blue',
          z: 10
        )
        position[4] = position[4].clear
        return

      elsif position[3] === $omega[6]
        Text.new(
        "#{position[2]}",
        x: 680, y: 20,
        size: 100,
        color: 'blue',
        z: 10
      )
      position[4] = position[4].clear
return

     
    elsif position[3] === $omega[7]
      Text.new(
      "#{position[2]}",
      x: 680, y: 350,
      size: 100,
      color: 'blue',
      z: 10
    )
    position[4] = position[4].clear
    return
    else
    Text.new(
    "#{position[2]}",
    x: 680, y: 680,
    size: 100,
    color: 'blue',
    z: 10
  )

  position[4] = position[4].clear
  return

                end
              end
            end
           
            position[3][position[0]][position[1]][2] = 1
            position[3][position[0]][position[1]][1].color = "#ffd31d"
            # heuristics
            position[5].push(position)

            fs = []

            # mark adjacent cells as queued.
            # then queue them.
            if validate(position[0]+1)
              if position[3][position[0]+1][position[1]][3] = 0
                fs.push([position[0]+1, position[1], position[2] += 1, position[3], position[4], position[5]])
                position[3][position[0]+1][position[1]][3] = 1
              end
            end

            if validate(position[0]-1)
              if position[3][position[0]-1][position[1]][3] = 0
                fs.push([position[0]-1, position[1], position[2] += 1, position[3], position[4], position[5]])
                position[3][position[0]-1][position[1]][3] = 1
              end
            end

            if validate(position[1]+1)
              if position[3][position[0]][position[1] + 1][3] = 0
                fs.push([position[0], position[1]+1, position[2] += 1, position[3], position[4], position[5]])
                position[3][position[0]][position[1]+1][3] = 1
              end
            end
            if validate(position[1]-1)
              if position[3][position[0]][position[1] - 1][3] = 0
                fs.push([position[0], position[1]-1, position[2] += 1, position[3], position[4], position[5]])
                position[3][position[0]][position[1]-1][3] = 1
              end
            end
            
            # queue adjacent cells
            fs = fs.sort_by { |el| (el[2] + euclidieanDistance([el[0], el[1]], "end"))}
           
            fs = fs.reverse()

            fs.each do |el|
              el[4].push(el)
            end
          
             
            end
          end
       end
    end
end

stack0 = []
stack1 = []
stack2 = []
stack3 = []
stack4 = []
stack5 = []
stack6 = []
stack7 = []
stack8 = []


stack0.push([0,0,0,$omega[0], stack0,[]])
stack1.push([0,0,0,$omega[1], stack1,[]])
stack2.push([0,0,0,$omega[2], stack2,[]])
stack3.push([0,0,0,$omega[3], stack3,[]])
stack4.push([0,0,0,$omega[4], stack4,[]])
stack5.push([0,0,0,$omega[5], stack5,[]])
stack6.push([0,0,0,$omega[6], stack6,[]])
stack7.push([0,0,0,$omega[7], stack7,[]])
stack8.push([0,0,0,$omega[8], stack8,[]])

update do
  1.times do
  
    if stack0.length > 0
      mark(stack0.pop())
    end
      if stack1.length > 0
        mark(stack1.pop())
      end
        if stack2.length > 0
          mark(stack2.pop())
        end
          if stack3.length > 0
            mark(stack3.pop())
          end
            if stack4.length > 0
              mark(stack4.pop())
            end
              if stack5.length > 0
                mark(stack5.pop())
              end
                if stack6.length > 0
                  mark(stack6.pop())
                end
                  if stack7.length > 0
                    mark(stack7.pop())
                  end
                    if stack8.length > 0
                      mark(stack8.pop())
                    end

  end
end


show







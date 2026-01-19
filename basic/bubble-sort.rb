# Basic bubble sort mechanism

def bubble_sort(array)
  for i in (0..array.length - 1)
    for j in (0..array.length - i - 2) # Need to stop earlier to account for j + 1
      if array[j] > array[j+1]
        array[j], array[j+1] = array[j+1], array[j]
      end
      
    end
  end
  array
end

print bubble_sort([4,3,78,2,0,2])
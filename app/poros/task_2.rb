class Task2

  # Implement a group_by_owners function that:
  # - Accepts a hash containing the file owner name for each file name.
  # - Returns a hash containing an array of file names for each owner name, in any order.

  def group_by_owners(files)
    files.each_with_object({}) do |(k, v), grouped|
      grouped[v] ||= []
      grouped[v] << k
    end
  end

  # for hash `{'Input.txt' => 'Randy', 'Code.py' => 'Stan', 'Output.txt' => 'Randy'}`
  # the group_by owners function should return
  # `{'Randy' => ['Input.txt', 'Output.txt'), 'Stan' => ['Code.py']}`
  def test_1
    files = {
      'Input.txt' => 'Randy',
      'Code.py' => 'Stan',
      'Output.txt' => 'Randy'
    }
    puts group_by_owners(files)
  end

end

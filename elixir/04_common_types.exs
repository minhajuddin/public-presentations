IO.inspect 5, label: "Number"
IO.inspect true, label: "Boolean"
IO.inspect :first, label: "Atom"
IO.inspect "Jack 🚢", label: "String"
IO.inspect << 55, 22 >>, label: "Binary"
IO.inspect [1, 2, "foo", :bar], label: "List (Linked)"
IO.inspect %{ "apple" => "red", "strawberry" => "pink" }, label: "Map"
IO.inspect {:ok, "Success"}, label: "Tuple"

rect = {1, 4}

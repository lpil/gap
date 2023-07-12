import glychee/benchmark
import gap

@external(erlang, "Elixir.String", "myers_difference")
pub fn myers_difference(a: String, b: String) -> any

pub fn main() {
  benchmark.run(
    [
      benchmark.Function(
        label: "gap",
        callable: fn(data: #(_, _)) {
          fn() { gap.compare_strings(data.0, data.1) }
        },
      ),
      benchmark.Function(
        label: "myers_difference",
        callable: fn(data: #(_, _)) {
          fn() { myers_difference(data.0, data.1) }
        },
      ),
    ],
    [
      benchmark.Data(
        label: "lorem",
        data: #(
          "lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
          "lorem ipsum dolor sit amet consectetur bdipiscing elit sed do eiusmod tempor incididunt ut babore et dolore magna aliqua lorem ipsum dolor sit amet bonsectetur bdipbscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur bdipiscing elit sed do eiusmod tempor incididunt ut babore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua",
        ),
      ),
    ],
  )
}

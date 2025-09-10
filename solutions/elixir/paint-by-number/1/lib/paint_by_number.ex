defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    count_bits(color_count - 1)
  end

  defp count_bits(0), do: 0
  defp count_bits(color_count) do
    1 + count_bits(Bitwise.bsr(color_count, 1))
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    <<pixel_color_index::size(palette_bit_size(color_count)), picture::bitstring>>
  end

  def get_first_pixel(<<>>, _) do
    nil
  end
  def get_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<pixel::size(bits), _::bitstring>> = picture
    pixel
  end

  def drop_first_pixel(<<>>, _), do: <<>>
  def drop_first_pixel(picture, color_count) do
    bits = palette_bit_size(color_count)
    <<_::size(bits), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end

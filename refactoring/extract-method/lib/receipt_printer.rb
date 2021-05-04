class ReceiptPrinter
  COST = {
    'meat' => 5,
    'milk' => 3,
    'candy' => 1
  }.freeze

  TAX = 0.05

  def initialize(output: $stdout, items:)
    @output = output
    @items = items
  end

  def print
    items_line
    divider_line
    subtotal_line
    tax_line
    divider_line
    total_line
  end

  private

  attr_reader :output, :items

  def tax
    subtotal * TAX
  end

  def item_cost(item)
    COST[item]
  end

  def subtotal
    @subtotal ||= items.sum { |item| item_cost(item).to_i }
  end

  def divider
    '-' * 13
  end

  def items_line
    items.each do |item|
      output_with(label: item, cost: item_cost(item))
    end
  end

  def divider_line
    output.puts divider
  end

  def subtotal_line
    output_with(label: 'subtotal', cost: subtotal)
  end

  def tax_line
    output_with(label: 'tax', cost: tax)
  end

  def total_line
    output_with(label: 'total', cost: subtotal + (subtotal * TAX))
  end

  def output_with(label:, cost:)
    output.puts "#{label}: #{format('$%.2f', cost)}"
  end
end

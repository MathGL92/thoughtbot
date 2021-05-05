class RecipientsSplitter
  def initialize(recipients)
    @recipients = recipients
  end

  def call
    @recipients.strip.split(/[\n,;]/)
  end
end

module SelectionHelper
  def enum_selection(model, attr, value = :key)
    model.public_send(attr.to_s.pluralize).map do |k, v|
      decorated_attr =
        begin
          model.new(
            attr => k
          ).decorate&.public_send(attr)&.presence
        rescue Draper::UninferrableDecoratorError, NoMethodError # rubocop:disable Lint/SuppressedException
        end

      [
        decorated_attr || k.titleize,
        case value
        when :value
          v
        else
          k
        end
      ]
    end
  end
end
class Build < ApplicationRecord
  belongs_to :post
  has_many_attached :images
  validates :images, presence: true

  def content_embeds1 
    if @attachments.any?
      # Если количество прикрепляемых файлов более 6 то ошибка
      errors.add(:content, 'Нельзя загружать более 6 изображений') if @attachments.size > 6
    end
  end

  def content_embeds2
    if @attachments.any?
      errors.add(:content, 'Нельзя загружать менее 6 изображений') if @attachments.size < 6
    end
  end
end
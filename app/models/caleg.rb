class Caleg < ActiveRecord::Base
	validates :peserta,
            presence: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }
  scope :by_peserta, lambda{ |peserta| where("peserta like ?", "%#{peserta}%") unless peserta.nil? }
  scope :by_asc, lambda{ |filed| order("#{filed} ASC") unless filed.nil? }
  scope :by_desc, lambda{ |filed| order("#{filed} DESC") unless filed.nil? }

  def self.apiall(data = {})
    caleg          = self.by_id(data[:id]).by_peserta(data[:peserta]).by_asc(data[:asc]).by_desc(data[:desc])
    paginate_caleg = caleg.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      caleg: paginate_caleg.map{|value| value.construct},
      count: paginate_caleg.count,
      total: caleg.count
		}
  end

  def construct
    return {
      id: id,
      peserta: peserta,
      dapil_1: dapil_1,
      dapil_2: dapil_2,
      dapil_3: dapil_3,
      dapil_4: dapil_4,
      dapil_5: dapil_5
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end

# frozen_string_literal: true

# Audition status
class AuditionStatus
  include Interactor
  delegate :q, :status, :search, :sort_column, :sort_direction, :page, to: :context

  def call # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    context.q = Audition.ransack(search)
    context.auditions = case status
                        when 'pending'
                          q.result.order("#{sort_column} #{sort_direction}").pending.page(page)
                        when 'accepted'
                          q.result.order("#{sort_column} #{sort_direction}").accepted.page(page)
                        when 'rejected'
                          q.result.order("#{sort_column}  #{sort_direction}").rejected.page(page)
                        when 'deleted'
                          q.result.order("#{sort_column}  #{sort_direction}").deleted.page(page)
                        else
                          q.result.order("#{sort_column} #{sort_direction}").page(page)
                        end
  end
end

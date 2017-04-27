class ReviewMailer < ApplicationMailer
  def new_review(review)
    @review = review
    mail(
          to: review.release.user.email,
          subject: "New Review for #{review.release.title}"
        )
  end
end

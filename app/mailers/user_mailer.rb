class UserMailer < ApplicationMailer
  def project_expired_notice
    @project = params[:project]

    mail to: @project.user.email, subject: "Your project has expired"
  end
end

class UserMailerPreview < ActionMailer::Preview
  def project_expired_notice
    UserMailer.with(project: Project.first).project_expired_notice
  end
end

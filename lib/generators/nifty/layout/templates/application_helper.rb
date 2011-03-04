module ApplicationHelper
  def chain(s1,s2); "#{s1.to_s}.#{s2.to_s}" end
  def edit(s); t2(:edit,s) end
  def lbl(s); chain(:label,s) end
  def new(s); t2(:new,s) end
  def pl(s); t(s).match(/\w/) ? t(s).pluralize : t(s) end
  def sure?; t('message.sure?') end
  def t2(s1,s2); t(lbl(s1), :obj => t(s2)) end
  def tp2(s1,s2); t(lbl(s1), :obj => pl(s2)) end
  def view(s); tp2(:view,s) end
end

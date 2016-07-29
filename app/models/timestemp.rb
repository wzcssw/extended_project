class Timestemp
  def Timestemp.auth param
    param_i = param.to_i
    range = Settings.timestemp.timestemp_range
    param_time = Time.at(param_i)
    now = Time.now
    if (now-range.minutes).to_i < param_i  && (now+range.minutes).to_i > param_i
      true
    else
      false
    end
  end
end

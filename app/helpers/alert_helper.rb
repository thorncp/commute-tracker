module AlertHelper
  BOOTSTRAP_FLASH_MAP = {
    "alert" => "alert-warning",
    "error" => "alert-danger",
    "notice" => "alert-info",
    "success" => "alert-success",
  }

  def alert_class_for(flash_type)
    BOOTSTRAP_FLASH_MAP.fetch(flash_type.to_s)
  end
end

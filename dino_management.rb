class DinoManagement
  MAX_HEALTH = 100

  def self.run(dinos)
    processed_dinos = dinos.map { |dino| process_dino(dino.dup) }

    {
      dinos: processed_dinos,
      summary: summarize(processed_dinos)
    }
  end

  def self.process_dino(dino)
    dino["health"] = calculate_health(dino)
    dino["comment"] = alive?(dino) ? "Alive" : "Dead"
    dino["age_metrics"] = age_metrics(dino)

    dino
  end

  def self.calculate_health(dino)
    return 0 unless dino["age"].positive?

    correct_diet =
      (dino["category"] == "herbivore" && dino["diet"] == "plants") ||
      (dino["category"] == "carnivore" && dino["diet"] == "meat")

    health = MAX_HEALTH - dino["age"]

    correct_diet ? health : health / 2
  end

  def self.alive?(dino)
    dino["health"].positive?
  end

  def self.age_metrics(dino)
    return 0 unless alive?(dino)
    return 0 unless dino["age"] > 1

    dino["age"] / 2
  end

  def self.summarize(dinos)
    dinos
      .group_by { |d| d["category"] }
      .transform_values(&:count)
  end

  private_class_method :process_dino,
                       :calculate_health,
                       :alive?,
                       :age_metrics,
                       :summarize
end
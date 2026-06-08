package pipeline

allowed_version := "v2"
required_template := "stagetest2"

deny[msg] {
  stage := input.pipeline.stages[_].stage
  stage.template.templateRef == required_template
  stage.template.versionLabel == allowed_version
  msg := sprintf("Stage '%s' must not use template version '%s', but uses '%s'", [
    stage.name,
    allowed_version,
    stage.template.versionLabel
  ])
}
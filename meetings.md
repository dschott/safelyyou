# Meeting Notes


## 2021-10-27 - Shirley intro to Safely You

- Closest competitior?
- Do facilities see this as a reduction of
- Response time improvements? Evening rates worse.
- Missed fall rate? Accuracy - 99.3%
- Assisted Living - Private
- Skilled Nursing Facility - Can't cook for themselves etc
  - short or long-term
  - 24/7 clinical support
  - SNF
- Locked units
- 3 min tag - 2 min staff
## 2021-10-14 - Guardian Multiple Models

Jason, Raghav

- LTS (Lay to sit) - No pytorch model yet
  - Replaces bed alarms (mats under patient beds)
- Second LTS service would be running (other than OTG)
- Upload a model - can upload different types
  - Assign to different GPUs
  - Upload? Process
- In the future, would want to re-architect to run multiple models on the same GPU
- Deploying a new model
  - Push model up to sky
  - Three components
    - 2 sets of params
    - Model / And Postprocessing
    - Binary file - model (200 mb)
  - On Guardian there is an ai update that pulls down the model from Sky
- I need a pytorch model for testing
- Video processing
  - Toolbox loads video frames into redis
  - AI service pulls from Redis (pytorch, caffe)
  - Not sure how toolbox is involved

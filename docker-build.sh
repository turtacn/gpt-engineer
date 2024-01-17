docker build --rm -t jdcloudiaas/turta:gpt-sangforer -f docker/Dockerfile .

touch
docker run -it --rm -v ./project:/project jdcloudiaas/turta:gpt-sangforer


python -m gpt_engineer.cli.main benchmark/pomodoro_timer --steps benchmark TheBloke_WizardCoder-Python-34B-V1.0-GPTQ
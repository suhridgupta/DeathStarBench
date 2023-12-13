{{- define "socialnetwork.templates.baseHPA" }}

apiVersion: autoscaling/v2
kind: HorizontalPodAutoscaler
metadata:
  name: {{ .Values.name }}
spec:
  scaleTargetRef:
    # point the HPA at the sample application
    # you created above
    apiVersion: apps/v1
    kind: Deployment
    name: {{ .Values.name }}
  # autoscale between 1 and 10 replicas
  minReplicas: 1
  maxReplicas: 10
  metrics:
  - type: Pods
    pods:
      metric:
        name: nginx_post_per_second
      target:
        type: Value
        averageValue: 10
  - type: Resource
    resource:
      name: cpu
      target:
        type: Utilization
        averageUtilization: 80

{{- end }}

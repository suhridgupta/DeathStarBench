{{- define "socialnetwork.templates.baseServiceMonitor" }}
apiVersion: monitoring.coreos.com/v1
kind: ServiceMonitor
metadata:
  name: {{ .Values.name }}
  labels:
    release: prometheus
spec:
  selector:
    matchLabels:
      app: {{ .Values.name }}
  endpoints:
  {{ - range .Values.ports }}
  - port: "{{ .port }}"
  {{- end }}
{{- end }}

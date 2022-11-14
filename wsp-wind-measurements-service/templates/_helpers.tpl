{{/*
Expand the name of the chart.
*/}}
{{- define "wind-measurements-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wind-measurements-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wind-measurements-service.labels" -}}
helm.sh/chart: {{ include "wind-measurements-service.chart" . }}
{{ include "wind-measurements-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wind-measurements-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wind-measurements-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

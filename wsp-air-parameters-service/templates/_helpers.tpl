{{/*
Expand the name of the chart.
*/}}
{{- define "air-parameters-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "air-parameters-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "air-parameters-service.labels" -}}
helm.sh/chart: {{ include "air-parameters-service.chart" . }}
{{ include "air-parameters-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "air-parameters-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "air-parameters-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

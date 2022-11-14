{{/*
Expand the name of the chart.
*/}}
{{- define "rainfall-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "rainfall-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rainfall-service.labels" -}}
helm.sh/chart: {{ include "rainfall-service.chart" . }}
{{ include "rainfall-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rainfall-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rainfall-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

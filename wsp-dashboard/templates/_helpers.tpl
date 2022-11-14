{{/*
Expand the name of the chart.
*/}}
{{- define "authentication-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "authentication-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "authentication-service.labels" -}}
helm.sh/chart: {{ include "authentication-service.chart" . }}
{{ include "authentication-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "authentication-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "authentication-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

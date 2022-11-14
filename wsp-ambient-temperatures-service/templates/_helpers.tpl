{{/*
Expand the name of the chart.
*/}}
{{- define "ambient-temperatures-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ambient-temperatures-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ambient-temperatures-service.labels" -}}
helm.sh/chart: {{ include "ambient-temperatures-service.chart" . }}
{{ include "ambient-temperatures-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ambient-temperatures-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ambient-temperatures-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

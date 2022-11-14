{{/*
Expand the name of the chart.
*/}}
{{- define "ground-temperatures-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ground-temperatures-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ground-temperatures-service.labels" -}}
helm.sh/chart: {{ include "ground-temperatures-service.chart" . }}
{{ include "ground-temperatures-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ground-temperatures-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "ground-temperatures-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

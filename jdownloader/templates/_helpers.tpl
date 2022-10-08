{{/*
Expand the name of the chart.
*/}}
{{- define "jdownloader.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "jdownloader.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "jdownloader.labels" -}}
helm.sh/chart: {{ include "jdownloader.chart" . }}
{{ include "jdownloader.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "jdownloader.selectorLabels" -}}
app.kubernetes.io/name: {{ include "jdownloader.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

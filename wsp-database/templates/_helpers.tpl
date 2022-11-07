{{/*
Expand the name of the chart.
*/}}
{{- define "weather-station-project-database.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "weather-station-project-database.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "weather-station-project-database.labels" -}}
helm.sh/chart: {{ include "weather-station-project-database.chart" . }}
{{ include "weather-station-project-database.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "weather-station-project-database.selectorLabels" -}}
app.kubernetes.io/name: {{ include "weather-station-project-database.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

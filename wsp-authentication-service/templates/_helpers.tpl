{{/*
Expand the name of the chart.
*/}}
{{- define "wsp-authentication-service.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "wsp-authentication-service.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "wsp-authentication-service.labels" -}}
helm.sh/chart: {{ include "wsp-authentication-service.chart" . }}
{{ include "wsp-authentication-service.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "wsp-authentication-service.selectorLabels" -}}
app.kubernetes.io/name: {{ include "wsp-authentication-service.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

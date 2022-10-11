{{/*
Expand the name of the chart.
*/}}
{{- define "openvpn.name" -}}
{{- default .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openvpn.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "openvpn.labels" -}}
helm.sh/chart: {{ include "openvpn.chart" . }}
{{ include "openvpn.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "openvpn.selectorLabels" -}}
app.kubernetes.io/name: {{ include "openvpn.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}


<%= simple_form_for(@form_chaga) do |f| %>
<%= f.error_notification %>

<div class="form-inputs">
  <div class="form-inputs">
    <div class="panel panel-default">
      <div class="panel-body">
        <div class="row">
        <div class="col-xs-6">
          <%= f.association :paciente,label_method: :nombres %></div>
          <div class="col-xs-6"><%= f.association :hospital %></div>
        </div>
      </div>
    </div>
</div>

<div class="form-inputs">
<div class="panel panel-default">
<div class="panel-body">
<div class="row">

<div class="col-sm-4">
    <%= f.input :muestra, :collection => FormChaga:: MUESTRA %>
</div>
<div class="col-sm-4">
    <%= f.input :diag_serologico, :collection  => FormChaga:: SEROLOGICO, :label => "Diagnostico serologico"  %>
</div>

<div class="col-sm-4">
    <%= f.input :conclucion_diag,  :label => "Conclusion Diagnostica"  %>
</div>
<div class="col-sm-4">
    <%= f.input :diag_confir,  :label => "Conclusion Diagnostica"  %>
</div>

<div class="col-sm-4">
    <%= f.input :conclucion_diag, :collection  => FormChaga:: CONFIRMACION, :label => "Diagnostico de Confirmacion"  %>
</div>
<div class="col-sm-4">
    <%= f.input :conclu_pueb_confir,  :label => "Conclusion de confirmacion"  %>
</div>
<div class="col-sm-4">
    <%= f.input :observaciones  %>
</div>
<div class="col-sm-4">
    <%= f.input :firma  %>
    </div>
    </div>
  </div>
</div>
</div>
<div class="form-actions">
    <%= f.button :submit  %>
    </div>
 <% end %>
    </div>
